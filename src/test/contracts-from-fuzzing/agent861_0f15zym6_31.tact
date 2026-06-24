struct S1 { s:String; }
struct S2 { inner: S1?; }

contract OptInnerString {
    data: S2;

    init() {
        self.data = S2{ inner: null };
    }

    receive() {
        let _ = self.data;
    }
}