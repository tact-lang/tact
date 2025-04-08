struct InnerMost { x: Int }
struct Inner { a: InnerMost }
struct Mids { b: Inner }
struct High { c: Mids }
struct Top { d: High }

contract NestedLayers {
    storage: Top;

    init() {
        self.storage = Top{d:High{c:Mids{b:Inner{a:InnerMost{x:42}}}}};
    }
}