struct OptSliceCellString {
 s: Slice?;
 c: Cell?;
 str: String?;
}

contract OptionalComp {
 s: OptSliceCellString = OptSliceCellString{s:null, c:null, str:null};
}