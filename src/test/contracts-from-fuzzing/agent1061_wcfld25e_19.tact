// default optional nested deeper
struct Inside { label: String? = null; flag: Bool = false; }

struct Wrapper { inner: Inside; num: Int = 0; }

contract Test {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: Inside{},
            num: 99
        };
    }
}