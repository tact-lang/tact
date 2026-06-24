struct Si {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Si?;
    y: Si?;
    z: Si?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            x: Si{a:1, b:true, c:"x"},
            y: null,
            z: Si{a:3, b:false, c:"z"}
        };
    }
}