struct SubData {
    item: Int?;
    flag: Bool?;
}

struct MainData {
    first: SubData;
    second: SubData?;
}

contract DefaultNulls {
    data: MainData;

    init() {
        self.data = MainData{
            first: SubData{},
            second: null,
        };
    }
}