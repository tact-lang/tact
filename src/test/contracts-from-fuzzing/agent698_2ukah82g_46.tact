struct Inner { a: Int; b: Bool; }
struct Outer { c: Int; d: Bool; e: Inner; }

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            c:42,
            d:true,
            e: Inner{ a:5, b:false }
        };
    }
}