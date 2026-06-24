// Testing struct with overlapping optional fields
struct OverlappingOpt {
    x: Int?;
    y: Int?;
}

contract OverlappingOptionalTest {
    data: OverlappingOpt;

    init() {
        self.data = OverlappingOpt{
            x: null,
            y: null
        };
    }
}