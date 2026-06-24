struct Composed {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    x: Int;
    y: Bool?;
    text: String;
}

struct Inner2 {
    addr: Address;
    flag: Bool;
}

contract TestComposed {
    storage: Composed;

    init() {
        self.storage = Composed{
            inner1: Inner1{
                x: 77,
                y: null,
                text: "hi"
            },
            inner2: Inner2{
                addr: myAddress(),
                flag: false
            }
        };
    }
}