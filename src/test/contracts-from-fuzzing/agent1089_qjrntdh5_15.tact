message(42) InnerMsg { val: Int?; }

struct WrapMsg { inner: InnerMsg = InnerMsg{}; }

contract NestedMsgOpt {
    storage: WrapMsg = WrapMsg{};
}