import "@stdlib/deploy";

message(42) Foo { }

contract TestNested with Deployable {
    init() { dump("Nested----init@SUCCESS") }
}

contract TestInit with Deployable {
    init() {
        try {
            let init: StateInit = initOf TestNested();
            dump("init@TestInit-1");
            send(SendParameters {
                to: contractAddress(init),
                value: 0,
                mode: SendIgnoreErrors | SendRemainingValue,
                code: init.code,
                data: init.data,
                body: Deploy { queryId: 0 }.toCell(),
            });
            dump("init@TestInit-SUCCESS");
        } catch (e) {
            dump("ERROR@TestInit");
            dump(e);
        }
    }

    receive(_: Foo) {}
}