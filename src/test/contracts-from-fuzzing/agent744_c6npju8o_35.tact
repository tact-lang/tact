struct TailStruct {
    value: Int;
    rest: Cell as remaining;
}

struct Layer2 {
    optInner: TailStruct?;
}

struct Layer1 {
    optMid: Layer2?;
}

contract DeepOptRemain {
    val: Layer1;

    init() {
        self.val = Layer1{
            optMid: Layer2{
                optInner: TailStruct{
                    value: 42,
                    rest: emptyCell()
                }
            }
        };
    }
}