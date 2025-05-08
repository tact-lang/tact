message(100) SimpleMsg { val: Int; }

struct Container { inner: SimpleMsg; }

contract MsgInStorage {
    stored: Container;
    init() {
        self.stored = Container{ inner: SimpleMsg{ val: 55 } };
    }
}