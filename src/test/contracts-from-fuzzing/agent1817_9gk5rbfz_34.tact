// Deeply nest string and cell
struct DeepCell {
    s: String;
    c: Cell;
}

struct DeeperCell {
    dc: DeepCell;
    flag: Bool;
}

contract DeepStringCell {
    d: DeeperCell;

    init() {
        self.d = DeeperCell{
            dc: DeepCell{s:"abc", c:emptyCell()},
            flag: true,
        };
    }
}