struct OptDeep3 {
    y: Int?;
}
struct OptDeep2 {
    x: OptDeep3?;
}
struct OptDeep1 {
    x: OptDeep2?;
}

contract DeepAssignedOptionals {
    val: OptDeep1;

    init() {
        self.val = OptDeep1{
            x: OptDeep2{
                x: OptDeep3{
                    y: null
                }
            }
        };
    }
}
