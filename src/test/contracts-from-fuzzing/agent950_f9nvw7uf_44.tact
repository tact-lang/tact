// test very deep nested optional chain witn mixed primitives inside struct fields
struct B0 { b1: B1?; s: String?; }
struct B1 { b2: B2?; flag: Bool?; }
struct B2 { b3: B3?; foo: Int?; }
struct B3 { x: Int?; text: String?; }

contract VeryDeepChain {
    top: B0?;

    init() {
        self.top = null;
    }
}