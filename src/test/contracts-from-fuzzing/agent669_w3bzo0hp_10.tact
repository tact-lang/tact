// Test opt field as top-level contract persistent variable
contract TopOpt {
    x: Int?;

    init() {
        self.x = null;
    }
}
