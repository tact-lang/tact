struct OptionalStuff {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: String?;
}

struct MixedStruct {
    mustBe: Int;
    couldBe: OptionalStuff;
    name: String;
}

contract Test {
    data: MixedStruct;

    init() {
        self.data = MixedStruct{
            mustBe: 5,
            couldBe: OptionalStuff{
                one: null,
                two: null,
                three: null,
                four: null
            },
            name: "Hello"
        };
    }
}