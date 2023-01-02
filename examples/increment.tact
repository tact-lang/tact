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
    counters: map[Int]Int;
    counters2: map[Int]Bool;
    counters3: map[Int]Cell;
    counters4: map[Address]Int;
    counters5: map[Int]Something;

    init() {
        // Nothing to do
    }

    receive(msg: Increment) {
        let ctx: Context = context();
        self.counters.set(msg.key, msg.value);
        self.counters4.set(ctx.sender, msg.value);
    }

    receive(msg: Toggle) {
        let ex: Bool? = self.counters2.get(msg.key);
        if (ex == null) {
            self.counters2.set(msg.key, true);
        } else {
            self.counters2.set(msg.key, !(ex!!));
        }
    }

    receive(msg: Persist) {
        require(self.counters3.get(msg.key) == null, "Empty counter");
        self.counters3.set(msg.key, msg.content);
    }

    receive(msg: Reset) {
        self.counters.set(msg.key, null);
        self.counters2.set(msg.key, null);
        self.counters3.set(msg.key, null);
        self.counters4.set(context().sender, null);
        self.counters5.set(msg.key, null);
    }

    get fun counters(): map[Int]Int {
        return self.counters;
    }

    get fun counters2(): map[Address]Int {
        return self.counters4;
    }
}