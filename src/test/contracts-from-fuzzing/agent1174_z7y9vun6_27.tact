struct OptionalSlices {
    a: Slice?;
    b: Slice?;
}

contract OptionalSlicesTest {
    data: OptionalSlices = OptionalSlices{ a:null, b:null };
}