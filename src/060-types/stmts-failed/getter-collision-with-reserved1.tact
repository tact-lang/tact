primitive String;

trait BaseTrait { }

contract TestContract {
    get fun getter1() {
        return;
    }

    get fun lazy_deployment_completed(): String{
        return "not ok";
    }
}
