struct InA { v: Int; }
struct InB { ia: InA; }

contract CrossInit {
    x: Int = 1;
    y: InB = InB{ ia: InA{ v: 42 } };
}