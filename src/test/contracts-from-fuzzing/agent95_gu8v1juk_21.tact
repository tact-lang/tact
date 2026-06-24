struct SubData {
    flag: Bool;
    rest: Slice as remaining;
}

contract TestContract {
    data: SubData;

    init() {
        self.data = SubData{
            flag: true,
            rest: slice("te6cckEBAQEAAgAAAEysuc0=")
        };
    }
}