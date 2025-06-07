struct StorageStruct {
    owner: Address?;
}

contract AssignNonOptToOpt {
    data: StorageStruct;

    init() {
        self.data = StorageStruct{
            owner: myAddress(),
        };
    }
}
