struct Mix1 { a: Int; b: Bool?; }
struct Mix2 { c: Mix1; d: String?; }
struct Mix3 { e: Mix2?; f: Cell; }

contract MixedDeepOptional {
    data: Mix3;
    init() {
        self.data = Mix3{ e: null, f: emptyCell() };
    }
}
