import "@stdlib/deploy";

message Increment {
    key: Int;
    value: Int;
}

message Toggle {
    key: Int;
}

message Persist {
    key: Int;
    content: Cell?;
}

message Reset {
    key: Int;
}

struct Something {
    value: Int;
}

contract IncrementContract with Deployable {
    counters: map<Int, Int>;
    counters2: map<Int, Bool>;
    counters3: map<Int, Cell>;
    counters4: map<Address, Int>;
    counters5: map<Int, Something>;

    receive(msg: Increment) {
        self.counters.set(msg.key, msg.value);
        self.counters4.set(sender(), msg.value);
    }

    receive(msg: Toggle) {
        let ex: Bool? = self.counters2.get(msg.key);
        if (ex == null) {
            self.counters2.set(msg.key, true);
        } else {
            let val: Bool = ex!!;
            self.counters2.set(msg.key, !val);
        }
    }

    receive(msg: Persist) {
        require(!self.counters3.exists(msg.key), "Empty counter");
        self.counters3.set(msg.key, msg.content);
    }

    receive(msg: Reset) {
        self.counters.del(msg.key);
        self.counters2.del(msg.key);
        self.counters3.del(msg.key);
        self.counters4.del(sender());
        self.counters5.del(msg.key);
    }

    get fun counters(): map<Int, Int> {
        return self.counters;
    }

    get fun counters2(): map<Address, Int> {
        return self.counters4;
    }
}
