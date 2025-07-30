struct Inner1 {
    x: Int;
    y: Bool;
}

struct Inner2 {
    z: Address;
    w: Bool?;
}

struct Outer {
    first: Inner1;
    second: Inner2;
    name: String;
    flag: Bool;
    count: Int;
}

contract NestedMultipleStructs {
    big: Outer;
    init() {
        self.big = Outer{
            first: Inner1{
                x:1,
                y:true
            },
            second: Inner2{
                z: myAddress(),
                w: null
            },
            name: "abc",
            flag: false,
            count: 77
        };
    }
}