struct Slot { val: Int; active: Bool; }

contract TupleSim {
    slot1: Slot;
    slot2: Slot;
    slot3: Slot;

    init() {
        self.slot1 = Slot{ val: 1, active: true };
        self.slot2 = Slot{ val: 2, active: false };
        self.slot3 = Slot{ val: 3, active: true };
    }
}