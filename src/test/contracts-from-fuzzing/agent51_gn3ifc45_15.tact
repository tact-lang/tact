struct Base1 { a: Int }
struct Base2 { b: Int }
struct Both {
  b1: Base1;
  b2: Base2;
}
contract TwoStructs {
    storage: Both;
    init() {
        self.storage = Both{ b1: Base1{a:5}, b2: Base2{b:10} };
    }
}
