void _start() {
    int* screen = (int*)0xB8000;
    *screen = 0x50505050;   
    return;
}