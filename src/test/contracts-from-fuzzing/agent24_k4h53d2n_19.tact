struct Outer {
    nest1: Inner1;
    nest2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: Int;
    y: String;
}

contract MultiNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            nest1: Inner1{ a:1, b:true },
            nest2: Inner2{ x:2, y:"x" }
        };
    }
}