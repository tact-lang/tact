contract SelfReceiver {
    receive() {
        let initPkg = initOf SelfReceiver();
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendIgnoreErrors,
            body: initPkg.code,
        });
    }
}
