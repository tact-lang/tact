struct Inner1 {
    n: Int;
}
struct Inner2 {
    s: String;
}
struct Container {
    first: Inner1;
    second: Inner2;
}

contract StructOfStructs {
    cont: Container;

    init() {
        self.cont = Container{
            first: Inner1{n:42},
            second: Inner2{s:"hi"}
        };
    }
}