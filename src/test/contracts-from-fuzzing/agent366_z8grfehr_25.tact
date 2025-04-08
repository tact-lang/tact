message(1) M1 { val: Int }

message(2) M2 { inner: M1? }

message(3) M3 { inner2: M2? }

contract NestedMsgs {
    data: M3?;

    init() {
        self.data = null;
    }
}