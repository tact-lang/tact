struct Left { a: Int } 
struct Right { b: Bool }
struct Pair { left: Left?; right: Right? }

contract FillOpt {
    pair: Pair?;
    init() {
        self.pair = Pair{
            left: null,
            right: Right{ b: true }
        };
    }
}