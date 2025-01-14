import "@stdlib/deploy";

contract Test with Deployable {
    receive("test") {}

    get fun A(): Int {
        let x1: Int = 42;
        {
            let x: Int = 42;
            {
                x1 += x;
            }
        }
        return x1;
    }
}
