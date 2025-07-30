struct Inner { foo: Int }
struct Outer { opt: Inner? }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ opt: null };
    }
}