struct A { a: Int }
struct B { b: Int }

contract TwoStructsFields {
    sa: A;
    sb: B;
    
    init() {
        self.sa = A{a: 1};
        self.sb = B{b: 2};
    }
}