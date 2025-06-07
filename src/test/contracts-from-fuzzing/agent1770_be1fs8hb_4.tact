struct AddressBook {
    person1: String;
    person2: String;
    person3: String;
    person4: String;
    person5: String;
    person6: String;
    person7: String;
    person8: String;
    person9: String;
    person10: String;
    person11: String;
    person12: String;
    person13: String;
    person14: String;
    person15: String;
    person16: String;
    person17: String;
    person18: String;
    person19: String;
    person20: String;
}

contract LongStrings {
    book: AddressBook;

    init() {
        self.book = AddressBook{
            person1:"A", person2:"B", person3:"C", person4:"D",
            person5:"E", person6:"F", person7:"G", person8:"H",
            person9:"I", person10:"J", person11:"K", person12:"L",
            person13:"M", person14:"N", person15:"O", person16:"P",
            person17:"Q", person18:"R", person19:"S", person20:"T",
        };
    }
}