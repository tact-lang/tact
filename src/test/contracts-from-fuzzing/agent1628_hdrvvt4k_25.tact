// Contract with various nested structs, optional fields, mixed layout
struct InnerMost { z: Int?; }
struct MidLevel { y: InnerMost?; x: Bool; }
struct TopLevel { m: MidLevel?; n: Int; }

contract TestContract {
    data: TopLevel?;
    init() {
        self.data = TopLevel{
            m: MidLevel{
                y: InnerMost{ z: null },
                x: true
            },
            n: 42
        };
    }
}