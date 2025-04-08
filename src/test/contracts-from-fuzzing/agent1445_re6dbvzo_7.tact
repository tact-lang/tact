contract DefaultsAndAssignments {
    someInt: Int = 5;
    optString: String?;
    myBool: Bool = false;
    mySlice: Slice;

    init() {
        self.optString = "initialized";
        self.mySlice = emptyCell().asSlice();
        self.someInt = 123;
        self.myBool = true;
    }
}