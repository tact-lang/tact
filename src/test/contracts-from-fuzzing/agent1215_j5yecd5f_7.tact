struct OptionalNested {
  field1: Int?;
  field2: Bool?;
  field3: Address?;
  field4: Cell?;
  field5: Slice?;
  field6: String?;
}

contract OptNested(
    val: OptionalNested?,
    val2: OptionalNested?,
) {}