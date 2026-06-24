struct StateSnapshot {
    count: Int;
    label: String;
    active: Bool;
    payload: Cell;
}

contract SnapshotExample {
    snapshot: StateSnapshot;

    init() {
        self.snapshot = StateSnapshot{
            count: 101,
            label: "init",
            active: true,
            payload: emptyCell()
        };
    }
}
