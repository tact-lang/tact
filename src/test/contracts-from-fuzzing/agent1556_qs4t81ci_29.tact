// optional struct with optional primitive inside
struct OptPrims {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    o: OptPrims?;

    init() {
        self.o = OptPrims{foo: null, bar: null};
    }

    receive() {
        let _ = self.o;
    }
}