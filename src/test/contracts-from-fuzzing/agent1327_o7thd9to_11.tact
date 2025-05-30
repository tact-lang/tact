struct SubPayload {
    flag: Bool;
    trailing: Cell as remaining;
}

struct Wrapper {
    payload: SubPayload;
    version: Int = 1;
}

contract Test {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            payload: SubPayload{
                flag: true,
                trailing: emptyCell()
            },
            version: 2
        };
    }
}