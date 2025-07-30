struct Inner1 { a: Int?; b: Bool?; }
struct Inner2 { x: String?; y: Address?; }
struct Middle {
    in1: Inner1?;
    in2: Inner2;
}
contract TestContract(param: Middle) {}
