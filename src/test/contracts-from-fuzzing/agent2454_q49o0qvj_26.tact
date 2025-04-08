struct AddressOptional {
    main: Address;
    recovery: Address?;
}

contract AddressOptTest {
    data: AddressOptional;
    
    init() {
        self.data = AddressOptional{
            main: myAddress(),
            recovery: null,
        };
    }
}