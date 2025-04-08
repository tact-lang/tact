contract LongFieldNames {
    thisIsA: Int;
    veryLongFieldName: Int;
    withLotsOfCharactersAndNumbers12345: Int;
    snake_case_field_name: Int;

    init() {
        self.thisIsA = 1;
        self.veryLongFieldName = 2;
        self.withLotsOfCharactersAndNumbers12345 = 3;
        self.snake_case_field_name = 4;
    }
}