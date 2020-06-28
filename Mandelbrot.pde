
double  minX, maxX, minY, maxY, dx, dy, w, h, x, y, a, b;

int MAX_ITER = 30;


void setup() {
    
    size(768, 768);    
    colorMode(HSB);


    w = 3;
    h = (w * height) / width;

    minX = -w/1.5;
    minY = -h/2;
    maxX = w + minX;
    maxY = h + minY;

    dx = (maxX - minX) / width;
    dy = (maxY - minY) / height;

}

void draw() {
   
    loadPixels();
    
    y = minY; 
    for (int j = 0; j < height; ++j) {
        x = minX; 
        for (int i = 0; i < width; ++i) {
           
            a = x;
            b = y;

            int n = 0;
           
            while (n < MAX_ITER) {
                
                double aa = a * a;
                double bb = b * b;
                
                double tuab = 2 * a * b ;
                a = aa - bb + x;
                b = tuab + y;

                if (aa + bb > 16) {
                    break;
                }

                n++;
            }
            

            float v1 = map(MAX_ITER - n, 0, MAX_ITER / 2, 0, 255);
            if(n == MAX_ITER) {
                pixels[i + j * width] =color(v1, 120, v1);
            } else { 
                pixels[i + j * width] = color(255 - v1, v1, 255 - v1);     
            }  
            x += dx;
        }
        y += dy;
    }
    updatePixels();
    noLoop();
}
