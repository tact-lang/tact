struct Info { val: Int = 1; name: String?; }
struct Status { ready: Bool = false; msg: String = "init"; }

contract ComplexFields {
    info: Info = Info{ val: 10, name: null };
    status: Status = Status{};

    init() {
        self.info = Info{ val: 42, name: "user" };
        self.status = Status{ ready: true, msg: "ok" };
    }
}