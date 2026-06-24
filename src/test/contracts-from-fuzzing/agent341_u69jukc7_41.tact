struct BorderCase {
    tiny: Int as uint1;
    huge: Int as int257;
}

contract TestContract {
    item: BorderCase;

    init() {
        self.item = BorderCase{
            tiny: 1,
            huge: 12345
        };
    }
}