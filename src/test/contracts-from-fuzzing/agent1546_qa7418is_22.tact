struct Layer3 { x: Int; y: Bool?; }
struct Layer2 { l3: Layer3; str: String; }
struct Layer1 { l2: Layer2; cell: Cell; }

contract MultiLayerNested {
    entry: Layer1;
    init() {
        self.entry = Layer1{
            l2: Layer2{
                l3: Layer3{ x:5, y:null },
                str:"hi"
            },
            cell: emptyCell()
        };
    }
}
