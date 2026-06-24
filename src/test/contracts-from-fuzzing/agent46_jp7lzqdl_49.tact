message(0xFA) Alpha { a: Int }
message(0xFB) Beta { b: Bool }
message(0xFC) Gamma { g: String? }

struct MultiMsgHolder {
    a: Alpha;
    b: Beta;
    c: Gamma;
}

contract MultiMsg {
    data: MultiMsgHolder;

    init() {
        self.data = MultiMsgHolder{
            a: Alpha{ a: 1 },
            b: Beta{ b: true },
            c: Gamma{ g: null }
        };
    }
}
