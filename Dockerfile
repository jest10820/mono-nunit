FROM mono:5.4.1

ARG NUNIT_VERSION=3.7.0

RUN nuget install NUnit.ConsoleRunner -o /tmp/nunit -Version $NUNIT_VERSION && \
    cp -R /tmp/nunit/NUnit.ConsoleRunner.$NUNIT_VERSION/tools/ /nunit/ && \
    rm -R /tmp/nunit

RUN echo '#!/bin/bash' >> /usr/bin/nunit && \
    echo 'mono /nunit/nunit3-console.exe "$@"' >> /usr/bin/nunit && \
    chmod +x /usr/bin/nunit
