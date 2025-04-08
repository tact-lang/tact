// nested optionals chain in struct inside root contract
struct O1 { o2: O2?; foo: Int?; }
struct O2 { o3: O3?; bar: Bool?; }
struct O3 { s: String?; }

contract FieldDeepChain {
    main: O1?;

    init() {
        self.main = null;
    }
}