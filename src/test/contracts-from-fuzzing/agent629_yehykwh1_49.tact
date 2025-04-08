// nested message with an inner optional message
message(1) InnerMsg { val: Int }
message(2) OuterMsg { inner: InnerMsg? }

contract Test {
    m: OuterMsg;
    init() {
        self.m = OuterMsg{ inner: null };
    }
}
