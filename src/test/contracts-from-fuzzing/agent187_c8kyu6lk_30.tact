struct DeepCompose {
    a: Int;
    b: Int;
    c: Inner;
    d: Inner;
}

struct Inner {
    x: Bool;
    y: String;
}

contract StorageDeepComposeTest {
    data: DeepCompose;

    init() {
        self.data = DeepCompose{
            a: 1,
            b: 2,
            c: Inner{x:true,y:"hi"},
            d: Inner{x:false,y:"bye"},
        };
    }
}