import "@stdlib/deploy";

contract WithDeploy with Deployable {}

contract WithoutDeploy {
    receive(_: Slice) {}
}