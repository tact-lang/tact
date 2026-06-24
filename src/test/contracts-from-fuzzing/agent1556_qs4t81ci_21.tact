// nested remaining slice initialized only in init, allow
struct ST1 {
    before: Int = 1;
    rem: Slice as remaining;
}

struct ST2 {
    lead: Int = 7;
    nest: ST1;
}

contract TestContract {
    val: ST2;

    init() {
        self.val = ST2{lead: 42, nest: ST1{before:11, rem: emptyCell().asSlice()}};
    }

    receive() {
        let _ = self.val.lead;
        let _ = self.val.nest.before;
        let _ = self.val.nest.rem;
    }
}