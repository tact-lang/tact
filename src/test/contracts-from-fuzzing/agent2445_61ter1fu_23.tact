struct VeryLongNestedStructNameWithManyCharacters01 {
    fieldWithExcessiveNameLengthAAAAAAAAAA: Int;
}

contract CrazyNames {
    crazyFieldNameThatIsSuperLongAndAbsurd: VeryLongNestedStructNameWithManyCharacters01;

    init() {
        self.crazyFieldNameThatIsSuperLongAndAbsurd = VeryLongNestedStructNameWithManyCharacters01{
            fieldWithExcessiveNameLengthAAAAAAAAAA: 999,
        };
    }

    receive() {}
}